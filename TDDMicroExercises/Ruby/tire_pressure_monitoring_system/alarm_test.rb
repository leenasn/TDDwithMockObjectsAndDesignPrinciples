require 'test/unit'
require 'mocha/test_unit'
require_relative './alarm'

class AlarmTest < Test::Unit::TestCase
  def test_alarm_is_off_with_right_pressure
    alarm = Alarm.new
    Sensor.any_instance.stubs(:pop_next_pressure_psi_value).returns(20)
    alarm.check
    assert(alarm.alarm_on == false)
  end
  def test_alarm_is_on_when_below_pressure
    alarm = Alarm.new
    Sensor.any_instance.stubs(:pop_next_pressure_psi_value).returns(16)
    alarm.check
    assert(alarm.alarm_on == true)
  end
  def test_alarm_is_on_when_above_pressure
    alarm = Alarm.new
    Sensor.any_instance.stubs(:pop_next_pressure_psi_value).returns(22)
    alarm.check
    assert(alarm.alarm_on == true)
  end
end
