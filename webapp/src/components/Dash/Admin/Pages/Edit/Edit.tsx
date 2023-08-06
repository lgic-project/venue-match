import { useState } from "react";
import {
  AppShell,
  Navbar,
  Header,
  MediaQuery,
  Burger,
  useMantineTheme,
  SimpleGrid,
  Stack,
  InputBase,
} from "@mantine/core";
import { Sidebar } from "../../Components/Sidebar/Sidebar";
import DashNavbar from "../../Components/Navabar/Navbar";
import Normal from "../../Components/Charts/Normal/Normal";
import BasicTable from "../../Components/Table/Table";
import "./Edit.scss";
import { IconChevronDown } from "@tabler/icons-react";
import { useForm } from "@mantine/form";

export default function Edit() {
  const form = useForm({
    initialValues: {
      role: "",
      ownerStatus: "",
      status: "",
    },
  });
  const theme = useMantineTheme();
  const [opened, setOpened] = useState(false);
  return (
    <AppShell
      style={{ backgroundColor: "#f8f9fa" }}
      layout="alt"
      styles={{
        main: {
          background:
            theme.colorScheme === "dark"
              ? theme.colors.dark[8]
              : theme.colors.gray[0],
        },
      }}
      navbarOffsetBreakpoint="sm"
      asideOffsetBreakpoint="sm"
      navbar={
        <Navbar
          p="md"
          hiddenBreakpoint="sm"
          hidden={!opened}
          width={{ sm: 200, lg: 250 }}
        >
          <MediaQuery largerThan="sm" styles={{ display: "none" }}>
            <Burger
              opened={opened}
              onClick={() => setOpened((o) => !o)}
              size="sm"
              color={theme.colors.gray[6]}
              mr="xl"
              style={{
                position: "absolute",
                right: "-15px",
                zIndex: 999,
                top: "20px",
              }}
            />
          </MediaQuery>
          <Sidebar />
        </Navbar>
      }
      header={
        <Header
          height={{ base: 50, md: 60 }}
          p="xs"
          style={{ backgroundColor: "#f8f9fa" }}
        >
          <div
            style={{ display: "flex", alignItems: "center", height: "100%" }}
          >
            <MediaQuery largerThan="sm" styles={{ display: "none" }}>
              <Burger
                opened={opened}
                onClick={() => setOpened((o) => !o)}
                size="sm"
                color={theme.colors.gray[6]}
                mr="xl"
              />
            </MediaQuery>
            <DashNavbar />
          </div>
        </Header>
      }
    >
      <div style={{ padding: "10px" }}>
        <SimpleGrid
          cols={2}
          spacing="20px"
          verticalSpacing="20px"
          breakpoints={[{ maxWidth: "36rem", cols: 1, spacing: "sm" }]}
        >
          <div className="left1">
            <div className="listTitle">Edit: <span style={{color:"black",fontSize:"20px"}}>Jhon Doe</span></div>
            <form onSubmit={form.onSubmit(() => {})}>
              <Stack>
                <InputBase
                  label="Change User Role -- current (Admin)"
                  // style={{height:"45px !important"}}
                  withAsterisk
                  component="select"
                  autoCapitalize="none"
                  autoCorrect="off"
                  autoComplete="off"
                  {...form.getInputProps("role")}
                  placeholder="I amd"
                  rightSection={<IconChevronDown size={14} stroke={1.5} />}
                >
                  <option value="user">Client</option>
                  <option value="venue_owner">Venue Owner</option>
                  <option value="admin">Admin</option>
                </InputBase>
                <InputBase
                  label="Change User Owner Status -- current (Verified)"
                  // style={{height:"45px !important"}}
                  withAsterisk
                  component="select"
                  autoCapitalize="none"
                  autoCorrect="off"
                  autoComplete="off"
                  {...form.getInputProps("role")}
                  placeholder="I amd"
                  rightSection={<IconChevronDown size={14} stroke={1.5} />}
                >
                  <option value="passive">Passive</option>
                  <option value="pending">Pending</option>
                  <option value="verified">Verified</option>
                </InputBase>
                <InputBase
                  label="Ban User -- current (False)"
                  // style={{height:"45px !important"}}
                  withAsterisk
                  component="select"
                  autoCapitalize="none"
                  autoCorrect="off"
                  autoComplete="off"
                  {...form.getInputProps("role")}
                  placeholder="I amd"
                  rightSection={<IconChevronDown size={14} stroke={1.5} />}
                >
                  <option value="false">False</option>
                  <option value="verified">True</option>
                </InputBase>
                <div
                  style={{
                    width: "100%",
                    display: "flex",
                    justifyContent: "center",
                  }}
                >
                  <button
                    type="submit"
                    style={{
                      width: "150px",
                      padding: "10px",
                      border: "none",
                      backgroundColor: "teal",
                      color: "white",
                      fontWeight: "bold",
                      display: "flex",
                      cursor: "pointer",
                      justifyContent: "center",
                    }}
                  >
                    Update{" "}
                  </button>
                </div>
              </Stack>
            </form>
          </div>
          <Normal aspect={3 / 1} title="User Spending (Last 6 Months)" />
        </SimpleGrid>
        <div style={{ paddingTop: "20px" }}>
          <div className="listContainer">
            <div className="listTitle">Latest Transaction</div>
            <BasicTable />
          </div>
        </div>
      </div>
    </AppShell>
  );
}
