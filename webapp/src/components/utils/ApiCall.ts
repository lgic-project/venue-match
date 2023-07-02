import axios from "axios";

export const PostQuery = async (route:any, data:any) => {
  const formData = new FormData();
  for (const key in data) {
    if (data.hasOwnProperty(key)) {
      formData.append(key, data[key]);
    }
  }

  try {
    return await axios.post(route, formData, {
      withCredentials: true,
    });
  } catch (error) {
    console.error(error);
    // Handle errors
    throw error; // Optionally, re-throw the error to propagate it further
  }
};
export const DeleteQuery = async (route: any) => {
  try {
    return axios.delete(route, {
      withCredentials: true,
    });
  } catch (e) {
    console.log(e, "errrrororor");
  }
};

export const FetchQuery = async (route: any) => {
  try {
    return axios.get(route, {
      withCredentials: true,
    });
  } catch (e) {
    console.log(e, "errrrororor");
  }[]
};

export const PatchQuery = async (route: any, data: any) => {
  try {
    return axios.patch(route, data, {
      withCredentials: true,
    });
  } catch (e) {
    console.log(e, "errrrororor");
  }
};
