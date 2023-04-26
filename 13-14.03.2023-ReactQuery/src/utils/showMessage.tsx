import toast from "react-hot-toast";

export enum MessageEnum {
  None,
  Error,
  Info,
}

export const showMessage = (messageType: MessageEnum, message: string) => {
  if (messageType === MessageEnum.None) return;

  messageType === MessageEnum.Error && toast.error(message, { duration: 4000 });
  messageType === MessageEnum.Info && toast(message, { duration: 4000 });
};
