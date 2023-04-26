import toast, { Toaster } from "react-hot-toast";

interface ToastProps {
  isShow: boolean;
  message: string;
}
const Toast: React.FC<ToastProps> = ({ isShow, message }) => {
  const notify = () => toast(message);
  return <div>{isShow && <Toaster />}</div>;
};

export default Toast;
