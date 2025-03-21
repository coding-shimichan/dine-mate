import NextAuth from "next-auth";
import { NextAuthOptions } from "next-auth";
import CredentialsProvider from "next-auth/providers/credentials";

export const authOptions: NextAuthOptions = {
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
        const data = await res.json();
        // If no error and we have user data, return it
        if (res.ok && data.token) {
          return {
            ...data, // accessible as 'user' in jwt method
          };
        }
        // Return null if user data could not be retrieved
        return null;
      },
    }),
  ],
  callbacks: {
    async jwt({ token, user, account, profile, isNewUser }) {
      if (user) {
        token = { ...user };
      }
      return token;
    },
    async session({ session, user, token }) {
      if (token) {
        session = { ...token };
      }
      return session;
    },
    async redirect({ url, baseUrl }) {
      return "/restaurants/search";
    },
  },
  session: {
    strategy: "jwt",
  },
};

const handler = NextAuth(authOptions);

export { handler as GET, handler as POST };
