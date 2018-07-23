module ::MItamae
  module Plugin
    module Resource
      class DarwinInstaller < ::MItamae::Resource::Base
        define_attribute :action, default: :install
        define_attribute :package, type: String, default_name: true
        define_attribute :device, type: String, default: "/"
        define_attribute :remote_file, type: [TrueClass, FalseClass], default: false
        define_attribute :curl_option, type: String, default: ""

        self.available_actions = [:install]
      end
    end
  end
end