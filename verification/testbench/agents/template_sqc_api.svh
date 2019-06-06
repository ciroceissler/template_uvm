`ifndef TEMPLATE_SQC_API_SVH
`define TEMPLATE_SQC_API_SVH

class template_sqc_api extends template_sqc_base;

  template_sqc_item template_sqi;

  `uvm_object_utils(template_sqc_api)

  // +--------------------------------------------------------------------------
  // | FUNCTION: constructor
  // +--------------------------------------------------------------------------
  function new(string name = "template_sqc");
    super.new(name);

    this.template_sqi = template_sqc_item::type_id::create("template_sqi");
  endfunction : new

  // +--------------------------------------------------------------------------
  // | TASK: set_data
  // +--------------------------------------------------------------------------
  task set_data(bit data, bit autostart = 1, bit dsply = 0);

    string tsk = "set_data";

    this.template_sqi.data = data;

    t_autostart(tsk, autostart);

    if(autostart && dsply) begin
      `uvm_info(get_type_name(), $sformatf("-> task = %s", tsk), UVM_HIGH)

      this.template_sqi.print();
    end

  endtask : set_data

  // +--------------------------------------------------------------------------
  // | TASK: t_autostart
  // +--------------------------------------------------------------------------
  task t_autostart(string tsk, bit autostart = 1);
    if(autostart) begin
      if (this.get_sequencer()) begin
        this.start(this.get_sequencer());
      end
      else begin
        `uvm_error(get_type_name(), $sformatf("set a sequencer before calling %0s as autostart", tsk))
      end
    end
  endtask : t_autostart


  // +--------------------------------------------------------------------------
  // | TASK: body
  // +--------------------------------------------------------------------------
  virtual task body();
    start_item(this.template_sqi);
    finish_item(this.template_sqi);
  endtask : body

endclass : template_sqc_api

`endif // TEMPLATE_SQC_API_SVH

