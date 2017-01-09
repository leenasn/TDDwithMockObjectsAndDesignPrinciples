require 'test/unit'
require_relative './telemetry_diagnostic_controls'
require 'mocha/test_unit'

class TelemetryDiagnosticControlsTest < Test::Unit::TestCase

 def test_print_diagnostic_info_if_connected
    TelemetryClient.any_instance.stubs(:online_status).returns(true)
    ctrl = TelemetryDiagnosticControls.new
    TelemetryClient.any_instance.expects(:send)
    TelemetryClient.any_instance.expects(:receive)
    ctrl.check_transmission
    assert_not_equal('',ctrl.diagnostic_info)
  end

 def test_raise_error_if_not_connected
    TelemetryClient.any_instance.stubs(:online_status).returns(false)
    ctrl = TelemetryDiagnosticControls.new
    assert_raise do
      ctrl.check_transmission
    end
    assert_equal('',ctrl.diagnostic_info)
  end
end
