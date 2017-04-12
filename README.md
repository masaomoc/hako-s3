# Hako::EnvProviders::S3

EnvProvider for [Hako](https://github.com/eagletmt/hako)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hako-s3'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hako-s3

## Usage

You have to put variable file in a specific format. Currently only JSON file is supported. 

```json
{
  "SOME_VARIABLE_KEY": "value1",
  "ANOTHER_VARIABLE_KEY" : "value2"
}
```

And you can write Hako's .yml as following:

```yaml
env:
  $providers:
    - type: s3
      bucket_name: some_bucket_name
      object_path: path_to_file
      region: ap-northeast-1
      profile: default
  ENV_VAR: '#{SOME_VARIABLE_KEY}'
  ANOTHOER_VAR: '#{ANOTHER_VARIABLE_KEY}'
```

### Parameters

#### Required

- type: s3 (fixed)
- bucket_name: your bucket name
- object_path: path to your S3 file
- region: S3 bucket region

#### Optional

- profile: profile name for [AWS Shared Credential File](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-multiple-profiles)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/masaomoc/hako-s3.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

