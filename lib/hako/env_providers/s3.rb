# frozen_string_literal: true
require 'hako/env_provider'
require 'aws-sdk'
require 'json'

module Hako
  module EnvProviders
    class S3 < EnvProvider
      
      VERSION = '0.0.1'
      
      def initialize(_root_path, options)
        %w(bucket_name object_path region).each do |k|
          unless options[k]
            validation_error!("required option #{k} must be specified")
          end
          aws_opts = {
            region: options.fetch('region')
          }
          if options.has_key?('profile')
            aws_opts.merge!(profile: options['profile'])
          end
          
          Aws.config.merge!(aws_opts)
          bucket_name = options.fetch('bucket_name')
          object_path = options.fetch('object_path')
          bucket = Aws::S3::Bucket.new(bucket_name)
          object = bucket.object(object_path)
          
          unless object.exists?
            validation_error!("#{bucket_name}/#{object_path} does not exist or is not readable")
          end
          
          @data = JSON.parse(object.body.read)
        end
      end

      def ask(variables)
        env = {}
        variables.each do |k|
          env[k] = @data.fetch(k, nil)
        end
        env
      end

      def can_ask_keys?
        true
      end

      def ask_keys(variables)
        @data.select { |k,v| variables.include?(k) }
      end

      private

      def validation_error!(message)
        raise ValidationError.new(message)
      end
    end
  end
end
