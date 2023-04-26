interface PaginationProps {
  currentPage: number;
  totalElements: number;
  onChange: (who: string) => void;
}

const Pagination: React.FC<PaginationProps> = ({
  currentPage,
  totalElements,
  onChange,
}) => {
  return (
    <div
      style={{
        display: "flex",
        justifyContent: "space-around",
        paddingTop: 24,
        paddingBottom: 24,
        paddingLeft: 8,
        paddingRight: 8,
      }}
    >
      <div
        style={{
          cursor: "pointer",
          width: 100,
          height: 30,
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
        }}
        onClick={() => onChange("first")}
      >
        &#60; &#60;
      </div>
      <div
        style={{
          cursor: "pointer",
          textAlign: "center",
          width: 100,
          height: 30,
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
        }}
        onClick={() => onChange("prev")}
      >
        &#60;
      </div>

      <div>
        {currentPage} / {totalElements}
      </div>
      <div
        style={{
          cursor: "pointer",
          textAlign: "center",
          width: 100,
          height: 30,
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
        }}
        onClick={() => onChange("next")}
      >
        &#62;
      </div>
      <div
        style={{
          cursor: "pointer",
          textAlign: "center",
          width: 100,
          height: 30,
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
        }}
        onClick={() => onChange("last")}
      >
        &#62; &#62;
      </div>
    </div>
  );
};

export default Pagination;
