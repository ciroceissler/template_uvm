class template_sqc_item extends uvm_sequence_item;

  rand bit data;

  `uvm_object_utils(template_sqc_item)

  // +--------------------------------------------------------------------------
  // | FUNCTION: constructor
  // +--------------------------------------------------------------------------
  function new(string name = "template_sqc_item");
    super.new(name);

    this.data = '0;
  endfunction : new

  // +--------------------------------------------------------------------------
  // | FUNCTION: do_print
  // +--------------------------------------------------------------------------
  virtual function void do_print(uvm_printer printer);
    `uvm_info(get_type_name(), $sformat("-> data = 0x%0b", this.data), UVM_HIGH)
  endfunction : do_print

  // +--------------------------------------------------------------------------
  // | FUNCTION: do_copy
  // +--------------------------------------------------------------------------
  virtual function void do_copy(uvm_object rhs);
    template_sqc_item rhs_;

    if (!$cast(rhs_, rhs)) begin
      `uvm_error("template_sqc_item do_copy:", "cast_failed")

      return;
    end

    super.do_copy(rhs);

    this.data = rhs_.data;

  endfunction : do_copy

endclass : template_sqc_item
