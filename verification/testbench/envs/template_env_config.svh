`ifndef TEMPLATE_ENV_CONFIG_SVH
`define TEMPLATE_ENV_CONFIG_SVH

class template_env_config extends uvm_object;

  localparam string config_id = "template_env_config";

  bit has_chk;
  bit has_abv;
  bit has_fcv;
  bit has_agent_template;

  template_agent_config template_ag_cfg;

  `uvm_object_utils(template_env_config)

  // +--------------------------------------------------------------------------
  // | FUNCTION: constructor
  // +--------------------------------------------------------------------------
  function new(string name = "template_env_config");
    super.new(name);
  endfunction : new

  // +--------------------------------------------------------------------------
  // | FUNCTION: get_config
  // +--------------------------------------------------------------------------
  virtual function template_env_config get_config(uvm_component c);
    template_env_config agent_config;

    if(!uvm_config_db #(template_env_config)::get(c, "", config_id, agent_config)) begin
      string message;

      message = $sformatf("can not get() configuration %s from UVM_CONFIG_DB", config_id);

      `uvm_fatal(get_type_name(), message)
    end

    return agent_config;
  endfunction : get_config

endclass : template_env_config

`endif // TEMPLATE_ENV_CONFIG_SVH

