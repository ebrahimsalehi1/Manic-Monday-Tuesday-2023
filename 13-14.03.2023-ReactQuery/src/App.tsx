import React from "react";
import { QueryClient, QueryClientProvider } from "react-query";
import { ReactQueryDevtools } from "react-query/devtools";
import Posts from "./Posts";
import "./App.css";
import PostInfinite from "./InfinitePosts";
import LoadingSpinner from "./LoadingSpinner/LoadingSpinner";
import { Toaster } from "react-hot-toast";

function App() {
  const queryClient = new QueryClient();

  const [typeProject, setTypeProject] = React.useState("Normal");

  return (
    <QueryClientProvider client={queryClient}>
      <div className="App">
        <h3>React Query App</h3>
        <div>
          <select
            aria-label="kindOfProject"
            onChange={(event) => {
              setTypeProject(event.target.value);
            }}
            value={typeProject}
          >
            <option value="Normal">Normal</option>
            <option value="Infinite">Infinite</option>
            <option value="OtherPossibility">Other possibility</option>
          </select>
        </div>
        <LoadingSpinner />
        <Toaster position="top-center" reverseOrder={false} />
        {typeProject === "Normal" && <Posts />}
        {typeProject === "Infinite" && <PostInfinite />}
      </div>
      <ReactQueryDevtools />
    </QueryClientProvider>
  );
}

export default App;
