import ssl

import tornado.ioloop
import tornado.web
from tornado.httpserver import HTTPServer


class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, world")

application = tornado.web.Application([
    (r"/", MainHandler),
])

if __name__ == "__main__":
    ssl_ctx = ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
    ssl_ctx.load_cert_chain("../keys/server.crt", "../keys/server.key")

    server = HTTPServer(
        application,
        ssl_options=ssl_ctx
    )
    server.listen(8888)

    print("server running, go to https://localhost:8888")
    tornado.ioloop.IOLoop.current().start()
