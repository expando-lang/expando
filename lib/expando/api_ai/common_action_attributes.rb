module Expando
  module ApiAi
    # Initializers and constants common to classes that carry out Dialogflow
    # actions.
    module CommonActionAttributes

      # The default location of intent source files
      DEFAULT_INTENTS_PATH = File.join(Dir.pwd, 'intents')

      # The default location of entity source files
      DEFAULT_ENTITIES_PATH = File.join(Dir.pwd, 'entities')

      # The default location of intent response source files
      DEFAULT_RESPONSES_PATH = File.join(Dir.pwd, 'responses')

      #
      def self.included(base)
        base.class_eval do
          extend ::Dry::Initializer

          # !@attribute object_names
          #   @return [Array<String>] The names of the objects to be updated.
          param :object_names, Expando::Types::Strict::Array, optional: true

          # !@attribute intents_path
          #   @return [String] The path to the directory containing the intent source
          #     files. (default: './intents')
          option :intents_path, Expando::Types::Strict::String,
                 default: proc { DEFAULT_INTENTS_PATH }

          # !@attribute entities_path
          #   @return [String] The path to the directory containing the entity source
          #     files. (default: './entities')
          option :entities_path, Expando::Types::Strict::String,
                 default: proc { DEFAULT_ENTITIES_PATH }

          # !@attribute responses_path
          #   @return [String] The path to the directory containing the intent response
          #     source files. (default: './responses')
          option :responses_path, Expando::Types::Strict::String,
                 default: proc { DEFAULT_RESPONSES_PATH }

          # !@attribute developer_access_token
          #   @return [String] The API.ai developer access token.
          option :developer_access_token, Expando::Types::Strict::String

          # !@attribute client_access_token
          #   @return [String] The API.ai client access token.
          option :client_access_token, Expando::Types::Strict::String
        end
      end
    end
  end
end