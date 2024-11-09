let _ =
  let width = ref 640 and height = ref 480 in
  let argv' = Glut.init Sys.argv in
  Glut.initDisplayMode ();
  Glut.initWindowSize ~w:!width ~h:!height;
  ignore (Glut.createWindow ~title:"The window name");
  let set_projection w h = () in
  let render () = () in
  let reshape ~w ~h =
    GLDraw.viewport 0 0 w h;
    set_projection w h;
    width := w; height := h;
    render ()
  in
  Glut.reshapeFunc ~cb:(reshape);
  Glut.displayFunc ~cb:(render);
  Glut.mainLoop ()
(* ocamlopt -I +lablGL lablgl.cmxa lablglut.cmxa render.ml -o render *)
