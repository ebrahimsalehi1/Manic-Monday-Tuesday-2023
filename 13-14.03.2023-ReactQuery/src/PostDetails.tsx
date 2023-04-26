import axios from "axios";
import React from "react";
import { useQuery, useMutation } from "react-query";
import { MessageEnum, showMessage } from "./utils/showMessage";
import { deletePost, editPost, fetchComments } from "./API/api";

interface PostDetailsProps {
  postId: number;
}

const PostDetails: React.FC<PostDetailsProps> = ({ postId }) => {
  const { data, isLoading, isError, error } = useQuery(
    ["comments", postId],
    () => fetchComments(postId),
    {
      staleTime: 2000,
    }
  );

  const deleteMutation = useMutation((postId: number) => deletePost(postId));
  const editMutation = useMutation((postId: number) => editPost(postId));

  if (isLoading) return <div>Loading .../</div>;

  //   if (isError) return <div>Something went wrong! {String(error)}</div>;

  isError &&
    showMessage(MessageEnum.Error, `Something went wrong ! ${String(error)}`);

  deleteMutation.isError &&
    showMessage(MessageEnum.Error, "Error deleting the post.");

  deleteMutation.isSuccess &&
    showMessage(MessageEnum.Info, "Deleted successfully.");

  editMutation.isError &&
    showMessage(MessageEnum.Error, "Error deleting the post.");

  editMutation.isSuccess &&
    showMessage(MessageEnum.Info, "Edited successfully.");

  return (
    <div
      style={{
        display: "flex",
        flexDirection: "column",
        borderTop: "1px solid black",
        paddingTop: 32,
      }}
    >
      Post Details {postId}
      <div
        style={{
          display: "flex",
          justifyContent: "space-around",
          paddingBottom: 32,
        }}
      >
        <button type="button" onClick={() => deleteMutation.mutate(postId)}>
          Delete Post
        </button>
        {/* {deleteMutation.isSuccess && (
          <p style={{ color: "purple" }}>Success deleting the post.</p>
        )}
        {deleteMutation.isLoading && (
          <p style={{ color: "purple" }}>Loading deleting the post ...</p>
        )}
        {deleteMutation.isError && (
          <p style={{ color: "red" }}>Error deleting the post !</p>
        )} */}
        <button type="button" onClick={() => editMutation.mutate(postId)}>
          Edit Post
        </button>
        {/* {editMutation.isSuccess && (
          <p style={{ color: "purple" }}>Success deleting the post.</p>
        )}
        {editMutation.isLoading && (
          <p style={{ color: "purple" }}>Loading deleting the post ...</p>
        )}
        {editMutation.isError && (
          <p style={{ color: "red" }}>Error deleting the post !</p>
        )} */}
      </div>
      {data.map((comment: any) => (
        <div
          key={comment.id}
          style={{
            height: 60,
            borderBottom: "1px solid black",
            paddingTop: 16,
          }}
        >
          <a href={comment.email}>{comment.name} </a>
          <div>{comment.body}</div>
        </div>
      ))}
    </div>
  );
};

export default PostDetails;
