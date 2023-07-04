import {
  TextInput,
  PasswordInput,
  Checkbox,
  Anchor,
  Paper,
  Group,
  Divider,
  Stack,
} from "@mantine/core";
// import { FacebookButton, GoogleButton } from "../SocialButtons/SocialButtons";
import { Link, useNavigate } from "react-router-dom";
import { isEmail, useForm } from "@mantine/form";
import { PostQuery } from "../utils/ApiCall";
import { LOGIN } from "../utils/ApiRoutes";
import { useMutation } from "@tanstack/react-query";
import Cookies from "js-cookie";
import Spinner from "../Spinner/Spinner";
import { showNotification } from "@mantine/notifications";

const handleLoginPost = async (data: any) => {
  return (await PostQuery(LOGIN, data))?.data;
};

export function Login() {

  const form = useForm({
    initialValues: {
      email: "",
      password: "",
      terms: true,
    },

    validate: {
      email: isEmail("Invalid Email"),

      // password: (val) => (/^\S+@\S+$/.test(val) ? null : "Invalid password"),
    },
  });

  const navigate = useNavigate();
  const { mutate, isLoading } = useMutation(handleLoginPost);
  const handleLogin = (data: any) => {
    mutate(data, {
      onSuccess: async (data) => {
        // const {data:user}= await FetchQuery(ME);
        // console.log(data.access_token);
        if ((data.error === true)) {
          showNotification({
            title: "Login Error",
            message: data.message,
            color: "red",
          });
         
        } else {
          Cookies.set("apikey", data.apiKey);
          navigate("/admin");
        }
      },
      onError: async (error: any) => {
        console.log(error.data.response);
      },
    });
  };

  return (
    <section className="form-section overflow-hidden" style={{ padding: 0 }}>
      {/* <Divider label="Log in with" labelPosition="center" my="lg" />
      <Group grow mb="md">
        <GoogleButton radius="xl">Google</GoogleButton>
        <FacebookButton radius="xl">FaceBook</FacebookButton>
      </Group> */}
      <Divider label="Venue Match" labelPosition="center" my="lg" />
      <Paper withBorder shadow="md" p={30} radius="md">
        <form
          onSubmit={form.onSubmit((values) => {
            handleLogin(values);
          })}
        >
          <Stack>
            <TextInput
              label="Email"
              placeholder="Enter Email"
              {...form.getInputProps("email")}
              radius={"100px"}
              height={"45px"}
            />
            <PasswordInput
              label="Password"
              placeholder="Enter Password"
              {...form.getInputProps("password")}
              radius={"100px"}
              height="45px"
            />
            <Group position="apart">
              <Checkbox label="Remember me" />
              <Anchor component="button" size="sm">
                <Link to="/forgot-password">Forgot password?</Link>
              </Anchor>
            </Group>
            <div className="banner-btn discover-btn-banner">
              <button
                type="submit"
                className="btn btn-primary"
                style={{
                  width: "100%",
                  paddingTop: "10px",
                  paddingBottom: "10px",
                  display: "flex",
                  flexDirection: "row",
                  justifyContent: "center",
                }}
              >
                Sign in {isLoading && <Spinner width="25px" />}
              </button>
            </div>
          </Stack>
        </form>
      </Paper>
    </section>
  );
}
