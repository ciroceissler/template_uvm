class template_report_server extends uvm_report_server;

  uvm_report_server        old_report_server;
  uvm_report_global_server global_server;

  // +--------------------------------------------------------------------------
  // | FUNCTION: new
  // +--------------------------------------------------------------------------
  function new(string name = "custom_report_server");
    super.new();

    set_name(name);

    global_server     = new();
    old_report_server = global_server.get_server();

    global_server.set_server(this);
  endfunction : new

  // +--------------------------------------------------------------------------
  // | FUNCTION: compose_message
  // +--------------------------------------------------------------------------
  virtual function string compose_message(uvm_severity severity,
    string name,
    string id,
    string message,
    string filename,
    int line
  );

    uvm_severity_type severity_type = uvm_severity_type'(severity);

    return $psprintf("%9s@%0t: [%30s] %s", severity_type.name(), $time, id, message);

  endfunction : compose_message

endclass : template_report_server
