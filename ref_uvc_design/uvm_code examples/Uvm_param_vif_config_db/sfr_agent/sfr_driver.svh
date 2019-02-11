//
//------------------------------------------------------------------------------
//   Copyright 2018 Mentor Graphics Corporation
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
//   Copyright 2018 Mentor Graphics Corporation
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//------------------------------------------------------------------------------
class sfr_driver #(SFR_ADDR_WIDTH = 8, SFR_DATA_WIDTH = 8) extends uvm_driver #(sfr_seq_item);

typedef sfr_driver #(SFR_ADDR_WIDTH, SFR_DATA_WIDTH) this_t;

`uvm_component_param_utils(this_t)

function new(string name = "sfr_driver", uvm_component parent = null);
  super.new(name, parent);
endfunction

virtual sfr_master_bfm #(SFR_ADDR_WIDTH, SFR_DATA_WIDTH) SFR;

extern task run_phase(uvm_phase phase);

endclass: sfr_driver

task sfr_driver::run_phase(uvm_phase phase);
  sfr_seq_item item;

  forever begin
    seq_item_port.get_next_item(item);
    SFR.execute(item);
    seq_item_port.item_done();
  end

endtask: run_phase
