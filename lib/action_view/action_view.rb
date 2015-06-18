# BEWARE: This is duck-punching Rails.

module ActionView
  module Helpers
    class DateTimeSelector
      TWELVE_HOUR_TRANSLATION = Hash[
        [[0, "12"], [1, "1"], [2, "2"], [3, "3"],
         [4, "4"], [5, "5"], [6, "6"], [7, "7"],
         [8, "8"], [9, "9"], [10, "10"], [11, "11"],
         [12, "12"], [13, "1"], [14, "2"], [15, "3"],
         [16, "4"], [17, "5"], [18, "6"], [19, "7"],
         [20, "8"], [21, "9"], [22, "10"], [23, "11"]]
      ].freeze

      def select_hour # Duck-punching
        if @options[:use_hidden] || @options[:discard_hour]
          build_hidden(:hour, hour)
        else
          options                    = {}
          options[:with_css_classes] = @options[:with_css_classes] || true
          options[:twelve_hour]      = @options[:twelve_hour] || false
          options[:ampm]             = @options[:ampm] || false
          options[:start]            = @options[:start_hour] || 0
          options[:end]              = @options[:end_hour] || 23
          build_options_and_select(:hour, hour, options)
        end
      end

    private

      # Build full select tag from date type and options.
      def build_options_and_select(type, selected, options = {})
        if type != :hour || !options[:twelve_hour]
          build_select(type, build_options(selected, options))
        else
          build_select(type, build_ampm_optgroups(selected, options))
        end
      end

      def build_ampm_optgroups(selected, options = {})
        am_start = [[options[:start], 0].max, 11].min
        am_end = [options[:end], 11].min
        pm_start = [options[:start], 12].max
        pm_end = [[options[:end], 23].min, 12].max
        groups = []
        groups << content_tag(:optgroup, build_options(selected, options.merge!({start: am_start, end: am_end})), label: 'am')
        groups << content_tag(:optgroup, build_options(selected, options.merge!({start: pm_start, end: pm_end})), label: 'pm')
        (groups.join("\n") + "\n").html_safe
      end

      def build_options(selected, options = {})
        options = {
          leading_zeros: true, ampm: false, use_two_digit_numbers: false
        }.merge!(options)

        start         = options.delete(:start) || 0
        stop          = options.delete(:end) || 59
        step          = options.delete(:step) || 1
        leading_zeros = options.delete(:leading_zeros)

        select_options = []
        start.step(stop, step) do |i|
          value = leading_zeros ? sprintf("%02d", i) : i
          tag_options = { :value => value }
          tag_options[:selected] = "selected" if selected == i
          text = options[:use_two_digit_numbers] ? sprintf("%02d", i) : value
          text = options[:twelve_hour] ? TWELVE_HOUR_TRANSLATION[i] : text # This line is the only diff from super
          text = options[:ampm] ? AMPM_TRANSLATION[i] : text
          select_options << content_tag(:option, text, tag_options)
        end

        (select_options.join("\n") + "\n").html_safe
      end
    end
  end
end
