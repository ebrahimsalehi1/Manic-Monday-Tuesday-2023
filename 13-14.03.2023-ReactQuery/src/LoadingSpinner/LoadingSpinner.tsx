import { useIsFetching, useIsMutating } from "react-query";
import "./LoadingSpinner.css";
const LoadingSpinner = () => {
  const isFetching = useIsFetching();
  const isMutating = useIsMutating();

  return (
    <div className={"loaderWrapper"}>
      {(isFetching || isMutating) && <div className={"loader"}></div>}
    </div>
  );
};

export default LoadingSpinner;
