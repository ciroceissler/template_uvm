class template_env extends uvm_env;

  template_agent template_ag;

  template_env_config env_config;

  `uvm_component_utils(template_env)

  // +--------------------------------------------------------------------------
  // | FUNCTION: constructor
  // +--------------------------------------------------------------------------
  function new(string name = "template_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  // +--------------------------------------------------------------------------
  // | FUNCTION: build_phase
  // +--------------------------------------------------------------------------
  virtual function build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db #(template_env_config)::get(this, "", "template_env_config", this.env_config)) begin
      `uvm_fatal(get_type_name(), "cannot get() template_env_config from uvm_config_db")
    end

    if (this.env_config.has_chk) begin
      // TODO(ciroceissler): add component
    end

    if (this.env_config.has_abv) begin
      // TODO(ciroceissler): add component
    end

    if (this.env_config.has_fcv) begin
      // TODO(ciroceissler): add component
    end

    if (this.env_config.has_agent_template) begin
      `uvm_info(get_type_name(), "creating template agent ...", UVM_HIGH)

      this.template_ag = template_agent::type_id::create("template_ag", this);
    end
  endfunction : build_phase

  // +--------------------------------------------------------------------------
  // | FUNCTION: connect_phase
  // +--------------------------------------------------------------------------
  virtual function connect_phase(uvm_phase phase);
    if (this.env_config.has_chk) begin
      // TODO(ciroceissler): component connection
    end

    if (this.env_config.has_fcv) begin
      // TODO(ciroceissler): component connection
    end
  endfunction : connect_phase

endclass : template_env
