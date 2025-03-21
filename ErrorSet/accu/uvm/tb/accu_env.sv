
class accu_env extends uvm_env;
  `uvm_component_utils(accu_env)

  accu_agent agent;
  accu_scoreboard scoreboard;

 function new(string name = "accu_env" , uvm_component parent = null);
    super.new(name, parent);
  endfunction


  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agent = accu_agent::type_id::create("agent", this);
    scoreboard = accu_scoreboard::type_id::create("scoreboard", this);
  endfunction

  function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
    //agent.monitor.ap.connect(scoreboard.ap);
	agent.agt_ap.connect(scoreboard.analysis_export);
  endfunction
endclass
