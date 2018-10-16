require 'salus/scanners/base'

module Salus::Scanners
  class PinnedBaseContainer < Base
    def run
      dockerfile = File.read("#{@repository.path_to_repo}/Dockerfile")
      from_line = dockerfile.each_line.select { |line| line.start_with?('FROM') }.first.strip

      # Typical FROM line is:
      # FROM abc/xyz:production@sha256:084b872...8ab750d
      # Check that we are pinning the base container to a sha256 fingerprint.
      if from_line.match?(/@sha256:[0-9a-f]{64}/)
        report_success

        # Report the base container image.
        image = from_line.sub('FROM ', '')
        report_info('base_container', image)
      else
        report_failure
      end
    end

    def should_run?
      File.exist?("#{@repository.path_to_repo}/Dockerfile")
    end
  end
end
