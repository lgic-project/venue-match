import {
  TextInput,
  PasswordInput,
  Paper,
  Group,
  Divider,
  Checkbox,
  Stack,
} from "@mantine/core";

import { FacebookButton, GoogleButton } from "../SocialButtons/SocialButtons";
import { hasLength, isEmail, matchesField, useForm } from "@mantine/form";
import { Link } from "react-router-dom";




export function Registration() {
  const form = useForm({
    initialValues: {
      firstName: "",
      lastName: "",
      email: "",
      mobileNumber: "",
      password: "",
      confirmPassword: "",
      terms: false,
    },
    validate: {
      firstName: hasLength(
        { min: 2, max: 10 },
        "Name must be 2-10 characters long"
      ),
      lastName: hasLength(
        { min: 2, max: 10 },
        "Name must be 2-10 characters long"
      ),
      email: isEmail("Invalid email"),
      mobileNumber: hasLength({ min: 2, max: 10 }, "Invalid mobile number"),
      password: hasLength(
        { min: 6 },
        "Password must have 6  or more characters"
      ),
      confirmPassword: matchesField("password", "Passwords are not the same"),
      terms: (termsCheck) =>
        termsCheck === false ? "Check the terms and conditions" : null,
    },
  });

  // const formValues = form.values;

  // const [post, setPost] = useState(formValues);

  // const handleInput = (event: any) => {
  //   setPost({ ...post, [event.target.name]: event.target.value });
  // };



  return (
    <section className="form-section overflow-hidden" style={{padding:0}}>
      <Divider label="Sign up with" labelPosition="center" my="lg" />
      <Group grow mb="md">
        <GoogleButton radius="xl">Google</GoogleButton>
        <FacebookButton radius="xl">FaceBook</FacebookButton>
      </Group>
      <Divider label="Or continue with" labelPosition="center" my="lg" />
      <Paper withBorder shadow="md" p={30} radius="md">
        <form
          onSubmit={form.onSubmit(() => {
          })}
        >
          <Stack>
            <TextInput
              name="firstName"
              label="First Name"
              placeholder="Enter First Name"
              withAsterisk
              {...form.getInputProps("firstName")}
              radius={"100px"}
              height={"45px"}
            />
            <TextInput
              label="Last Name"
              placeholder="Enter Last Name"
              withAsterisk
              {...form.getInputProps("lastName")}
              radius={"100px"}
              height={"45px"}
            />
            <TextInput
              label="Email"
              placeholder="Enter Email"
              withAsterisk
              {...form.getInputProps("email")}
              radius={"100px"}
              height={"45px"}
            />
            <TextInput
              label="Mobile Number"
              placeholder="Enter Mobile Number"
              withAsterisk
              {...form.getInputProps("mobileNumber")}
              radius={"100px"}
              height={"45px"}
            />
            <PasswordInput
              label="Password"
              placeholder="Enter Password"
              withAsterisk
              {...form.getInputProps("password")}
              radius={"100px"}
              height={"45px"}
            />
            <PasswordInput
              label="Confirm Password"
              placeholder="Enter Password Again"
              withAsterisk
              {...form.getInputProps("confirmPassword")}
              radius={"100px"}
              height={"45px"}
            />
            <Group>
              <Checkbox
                checked={form.values.terms}
                {...form.getInputProps("terms")}
              />
              <Link to="/">I accept terms and conditions</Link>
            </Group>
            <div className="banner-btn discover-btn-banner">
            <button type="submit"  className="btn btn-primary" style={{width:"100%",paddingTop:"10px",paddingBottom:"10px"}}>
              Sign up
            </button>
            </div>
          </Stack>
        </form>
      </Paper>
    </section>
  );
}
