if(intf[2] & ins_errors[1]) begin : PERR

      wait(uif.interrupt[2]);
      $display("\033[1;31mError Interrupt Has Been Asserted.\033[0m");
      if(!read_data[3]) begin

        $display("\033[1;31mParity error was not detected during RECEIVE_PARITY_ERROR test\033[0m");
        print_test_result("\033[1;31mFAILED\033[0m");

      end

      if(!symbol[9]) begin

        $display("\033[1;31mIllegaly detected parity error during data receiption @%t. Testbench didn't generate this error\033[0m", $time);
        print_test_result("FAILED");
        $finish(2);

      end

      else begin
        $display("\033[1;32mDetected parity error correctly generated by testbench @%t\033[0m", $time);

        if(!read_data[2]) begin
          reg_access( `UART_BASE_ADDRESS + `UART_RXBUF_REGISTER,
                      REG_RD,
                      32'h0,
                      4'h0,
                      read_data,
                      error
                    );
        end

      end

end : PERR

else begin : PERR_N

      $display("\033[1;31mError!!Nothing Happend!! PERR\033[0m");
      $finish;

end : PERR_N