`ifndef TEMPLATE_AGENT_CONFIG_SVH
`define TEMPLATE_AGENT_CONFIG_SVH

class template_agent_config extends uvm_object;

  localparam string config_id = "template_agent_config";

  template_vif_t template_vif;

  uvm_active_passive_enum active_mode;

  bit has_check;
  bit has_monitor;
  bit has_coverage;

  // +--------------------------------------------------------------------------
  // | FUNCTION: constructor
  // +--------------------------------------------------------------------------
  function new(string name = "template_agent_config");
    super.new(name);

    this.active_mode = UVM_ACTIVE;

    this.has_check    = 1;
    this.has_monitor  = 1;
    this.has_coverage = 1;
  endfunction : new

  // +--------------------------------------------------------------------------
  // | FUNCTION: get_config
  // +--------------------------------------------------------------------------
  virtual function template_agent_config get_config(uvm_component c);
    template_agent_config agent_config;

    if(!uvm_config_db #(template_agent_config)::get(c, "", config_id, agent_config)) begin
      string message;

      message = $sformatf("can not get() configuration %s from UVM_CONFIG_DB", config_id);

      `uvm_fatal(get_type_name(), message)
    end

    return agent_config;
  endfunction : get_config

  // +--------------------------------------------------------------------------
  // | FUNCTION: get_vif
  // +--------------------------------------------------------------------------
  virtual function template_vif_t get_vif();
    return this.template_vif;
  endfunction : get_vif

  // +--------------------------------------------------------------------------
  // | FUNCTION: set_vif
  // +--------------------------------------------------------------------------
  virtual function set_vif(template_vif_t vif);
    this.template_vif = vif;
  endfunction : set_vif

endclass : template_agent_config

`endif // TEMPLATE_AGENT_CONFIG_SVH

