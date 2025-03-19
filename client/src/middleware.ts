import { withAuth } from "next-auth/middleware";

export default withAuth(function middleware() {}, {
  pages: {
    signIn: "/api/auth/signin",
  },
});

export const config = {
  matcher: ["/((?!api/auth/signin|auth/sign_up|_next).*)"],
};
