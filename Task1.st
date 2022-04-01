PROGRAM test
  VAR
    Start_button AT %IX100.2 : BOOL;
    Stop_button AT %IX100.3 : BOOL;
    Sensor AT %IX100.1 : BOOL;
    Conveyor AT %QX100.0 : BOOL;
  END_VAR
  VAR
    F_TRIG1 : F_TRIG;
  END_VAR

  Conveyor := Stop_button AND (Conveyor OR Start_button);
  F_TRIG1(CLK := Sensor);
  IF F_TRIG1.Q THEN
    Conveyor := FALSE; (*reset*)
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : test;
  END_RESOURCE
END_CONFIGURATION
