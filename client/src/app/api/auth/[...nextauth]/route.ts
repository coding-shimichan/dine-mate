import NextAuth from "next-auth";
import { NextAuthOptions } from "next-auth";
import CredentialsProvider from "next-auth/providers/credentials";

const authOptions: NextAuthOptions = {
  providers: [
    CredentialsProvider({
      name: "DineMate",
      credentials: {
        email: {
          label: "Email",
          type: "text",
        },
        password: { label: "Password", type: "password" },
      },
      async authorize(credentials) {
        const API_URL = process.env.NEXT_PUBLIC_RAILS_API_URL;
        const res = await fetch(`${API_URL}/users/tokens/sign_in`, {
          method: "POST",
          body: JSON.stringify(credentials),
          headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
          },
        });
        const user = await res.json();
        console.log({ res });
        // If no error and we have user data, return it
        if (res.ok && user) {
          return user;
        }
        // Return null if user data could not be retrieved
        return null;
      },
    }),
  ],
  // pages: { signIn: "/sign_in" },
};

const handler = NextAuth(authOptions);

export { handler as GET, handler as POST };
