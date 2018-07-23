module ::MItamae
  module Plugin
    module ResourceExecutor
      class DarwinInstaller < ::MItamae::ResourceExecutor::Base

        def apply
          if desired.remote_file
            basename = File.basename(attributes.package)

            url  = attributes.package
            dest = "/tmp/#{basename}"
            download_file(url, dest)

            install_package(dest)
          else
            install_package(attributes.package)
          end
        end

        private

        def set_current_attributes(current, action)
          case action
          when :install
            current.installed = false
          end
        end

        def set_desired_attributes(desired, action)
          case action
          when :install
            desired.installed = true
          end
        end

        def download_file(url, dest)
          run_command(["curl", attributes.curl_option, "-sSL", url, "-o", dest])
        end

        def install_package(package)
          run_command(["sudo", "installer", "-pkg", package, "-target", attributes.device])
        end
      end
    end
  end
end