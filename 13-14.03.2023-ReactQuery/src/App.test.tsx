import React from "react";
import { render, screen } from "@testing-library/react";
import App from "./App";
import Posts from "./Posts";
import { QueryClient, QueryClientProvider } from "react-query";

test("renders learn react link", () => {
  const queryClient = new QueryClient();

  render(
    <QueryClientProvider client={queryClient}>
      <Posts />
    </QueryClientProvider>
  );

  const linkElement = screen.getByText(/Loading ..../i, { exact: false });
  expect(linkElement).toBeInTheDocument();
});
