// install consul
sudo consul agent -dev -client=0.0.0.0 -dns-port=53 -recursor=8.8.8.8

// run nomad
sudo nomad agent -config=nomad.hcl

// run tasks
sudo nomad run <task>.nomad

// see status
nomad status

// to scale, just add nodes to nomad cluster by running nomad agent on them and joining on master's nomad interface
// rolling updates: just execute "nomad run <task>.nomad" again after updating the configs
