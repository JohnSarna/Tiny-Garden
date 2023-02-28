randomize();

instance_create_layer(-1, -1, "Handlers", obj_handler_instance_spawner);
instance_create_layer(-1, -1, "Handlers", obj_handler_draw);
instance_create_layer(-1, -1, "Handlers", obj_handler_camera);

//show_debug_overlay(true);