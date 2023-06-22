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
import { FacebookButton, GoogleButton } from "../SocialButtons/SocialButtons";
import { Link } from "react-router-dom";
import { isEmail, useForm } from "@mantine/form";

export function Login() {
  const form = useForm({
    initialValues: {
      email: "",
      password: "",
      terms: true,
    },

    validate: {
      email: isEmail("Invalid email"),

      // password: (val) => (/^\S+@\S+$/.test(val) ? null : "Invalid password"),
    },
  });

  return (
    <section className="form-section overflow-hidden" style={{padding:0}}>
      <Divider label="Log in with" labelPosition="center" my="lg" />
      <Group grow mb="md">
        <GoogleButton radius="xl">Google</GoogleButton>
        <FacebookButton radius="xl">FaceBook</FacebookButton>
      </Group>
      <Divider label="Or continue with" labelPosition="center" my="lg" />
      <Paper withBorder shadow="md" p={30} radius="md">
        <form onSubmit={form.onSubmit(() => {})}>
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
                <Link to="/forgot-password" >Forgot password?</Link>
              </Anchor>
            </Group>
            <div className="banner-btn discover-btn-banner">
            <button type="submit" className="btn btn-primary" style={{width:"100%",paddingTop:"10px",paddingBottom:"10px"}}>
              Sign in
            </button>
          </div>
          
          </Stack>
        </form>
      </Paper>
    </section>
  );
}
