import React from "react";
import { useQuery, useQueryClient } from "react-query";
import PostDetails from "./PostDetails";
import Pagination from "./Pagination";
import { MessageEnum, showMessage } from "./utils/showMessage";
import { fetchPosts } from "./API/api";

const maxPostPage = 25;

const Posts = () => {
  const [selectedPost, setSelectedPost] = React.useState(0);
  const [currentPage, setCurrentPage] = React.useState(1);

  const { data, isError, error, isLoading, isFetching } = useQuery(
    ["posts", currentPage],
    () => fetchPosts(currentPage),
    { staleTime: Infinity }
  );

  //   const queryClient = useQueryClient();
  //   React.useEffect(() => {
  //     queryClient.prefetchQuery(["posts", currentPage], () =>
  //       fetchData(currentPage)
  //     );

  //     // eslint-disable-next-line react-hooks/exhaustive-deps
  //   }, [currentPage, queryClient]);

  if (isLoading) return <div>Loading ....</div>;

  if (isFetching) return <div>fetching ....</div>;

  isError &&
    showMessage(
      isError ? MessageEnum.Error : MessageEnum.None,
      `Something went wrong ! ${String(error)}`
    );

  return (
    <div style={{ display: "flex", flexDirection: "column" }}>
      <ul style={{ paddingLeft: 8, paddingRight: 8 }}>
        {data?.map((post: any, index: number) => (
          <li
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
            key={post.id}
            onClick={() => setSelectedPost(post.id)}
          >
            {post.id}-{post.title}
          </li>
        ))}
      </ul>
      {data && data.length > 0 && (
        <Pagination
          currentPage={currentPage}
          totalElements={maxPostPage}
          onChange={(who: string) => {
            switch (who) {
              case "first":
                setCurrentPage(1);
                break;
              case "prev":
                setCurrentPage((prev) => (prev === 1 ? 1 : --prev));

                break;
              case "next":
                setCurrentPage((prev) =>
                  prev === maxPostPage ? maxPostPage : ++prev
                );

                break;
              case "last":
                setCurrentPage(maxPostPage);

                break;
            }
          }}
        />
      )}
      <div>{selectedPost !== 0 && <PostDetails postId={selectedPost} />}</div>
    </div>
  );
};

export default Posts;
