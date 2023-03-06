open Cohttp_lwt_unix
open Yojson.Basic

let articles = [
  {|"id": 1, "name": "Article 1"|};
  {|"id": 2, "name": "Article 2"|};
  {|"id": 3, "name": "Article 3"|};
  {|"id": 4, "name": "Article 4"|};
  {|"id": 5, "name": "Article 5"|};
  {|"id": 6, "name": "Article 6"|};
  {|"id": 7, "name": "Article 7"|};
  {|"id": 8, "name": "Article 8"|};
  {|"id": 9, "name": "Article 9"|};
  {|"id": 10, "name": "Article 10"|};
]

let articles_handler _req _body =
  let headers = Cohttp.Header.init_with "content-type" "application/json" in
  let body = List.map (fun article -> Yojson.Basic.from_string article) articles in
  let body_json = `List body in
  let body_string = Yojson.Basic.to_string body_json in
  let resp = Cohttp.Response.make ~status:`OK ~headers () in
  Cohttp_lwt_unix.Server.respond_string ~status:`OK ~body:body_string ~headers ()

let server =
  let callback _conn req body =
    let uri = req |> Request.uri |> Uri.to_string in
    match (req |> Request.meth, uri) with
    | (`GET, "/articles") -> articles_handler req body
    | _ -> Cohttp_lwt_unix.Server.respond_not_found ()
  in
  Cohttp_lwt_unix.Server.create ~mode:(`TCP (`Port 8081)) (Cohttp_lwt_unix.Server.make ~callback ())

let () =
  Lwt_main.run server
