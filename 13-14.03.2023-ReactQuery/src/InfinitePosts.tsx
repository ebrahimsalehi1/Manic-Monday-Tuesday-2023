//import axios from "axios";
import { useInfiniteQuery } from "react-query";
import { MessageEnum, showMessage } from "./utils/showMessage";
import { fetchPosts } from "./API/api";

const maxPostPage = 25;

const InfinitePosts = () => {
  const fetchData = async ({ pageParam = 1 }) => {
    return fetchPosts(pageParam);
  };

  const {
    data,
    fetchNextPage,
    hasNextPage,
    isLoading,
    isFetching,
    isError,
    error,
  } = useInfiniteQuery("people", fetchData, {
    getNextPageParam: (_, pages) => {
      if (pages.length < maxPostPage) return pages.length + 1;
      else return undefined;
    },
  });

  if (isLoading) return <div>Loading ...</div>;

  if (isFetching) return <div>Fetching ....</div>;

  isError &&
    showMessage(
      isError ? MessageEnum.Error : MessageEnum.None,
      `Something went wrong ! ${String(error)}`
    );

  return (
    <div>
      Post Infinite
      {data?.pages.map((post: any, index: number) =>
        post.map((item: any) => (
          <div
            style={{
              display: "flex",
              listStyle: "none",
              height: 50,
              alignSelf: "center",
              backgroundColor: index % 2 === 0 ? "goldenrod" : "silver",
              alignItems: "center",
              cursor: "pointer",
              paddingLeft: 8,
            }}
            key={item.id}
          >
            {item.id}- {item.title}
          </div>
        ))
      )}
      <div
        style={{
          backgroundColor: hasNextPage ? "greenn" : "gray",
          position: "fixed",
          top: 110,
          right: 20,
          zIndex: 99,
          padding: 4,
          cursor: "pointer",
          border: "1px solid darkgreen",
          borderRadius: 50,
        }}
        onClick={() => {
          fetchNextPage();
          window.scrollTo(0, document.body.scrollHeight);
        }}
      >
        Show More ...
      </div>
    </div>
  );
};

export default InfinitePosts;
