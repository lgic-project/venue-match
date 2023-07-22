import {
    createStyles,
    Navbar,
    Text,
    Group,
    rem,
    ScrollArea,
  } from "@mantine/core";
  import download from "../../../../../assets/images/download.png";
  import {
    IconArrowsExchange2,
    IconBell,
    IconBuildingCottage,
    IconCategory,
    IconChartBar,
    IconCreditCard,
    IconLayoutDashboard,
    IconLogout,
    IconSettings,
    IconUserCircle,
  } from "@tabler/icons-react";
  import { Link } from "react-router-dom";
  
  const useStyles = createStyles((theme) => ({
    navbar: {
      paddingTop: 0,
      backgroundColor:"#f8f9fa"
    },
  
    section: {
      marginLeft: `calc(${theme.spacing.md} * -1)`,
      marginRight: `calc(${theme.spacing.md} * -1)`,
      marginBottom: theme.spacing.md,
  
      "&:not(:last-of-type)": {
        borderBottom: `${rem(1)} solid ${
          theme.colorScheme === "dark"
            ? theme.colors.dark[4]
            : theme.colors.gray[3]
        }`,
      },
  
      display: "flex",
      justifyContent: "center",
    },
  
    searchCode: {
      fontWeight: 700,
      fontSize: rem(10),
      backgroundColor:
        theme.colorScheme === "dark"
          ? theme.colors.dark[7]
          : theme.colors.gray[0],
      border: `${rem(1)} solid ${
        theme.colorScheme === "dark" ? theme.colors.dark[7] : theme.colors.gray[2]
      }`,
    },
  
    mainLinks: {
      paddingLeft: `calc(${theme.spacing.md} - ${theme.spacing.xs})`,
      paddingRight: `calc(${theme.spacing.md} - ${theme.spacing.xs})`,
      paddingBottom: theme.spacing.md,
    },
  
    mainLink: {
      display: "flex",
      alignItems: "center",
      width: "100%",
      fontSize: theme.fontSizes.xs,
      padding: `${rem(8)} ${theme.spacing.xs}`,
      borderRadius: theme.radius.sm,
      fontWeight: 500,
      color:
        theme.colorScheme === "dark"
          ? theme.colors.dark[0]
          : theme.colors.gray[7],
  
      "&:hover": {
        backgroundColor:
          theme.colorScheme === "dark"
            ? theme.colors.dark[6]
            : theme.colors.gray[0],
        color: theme.colorScheme === "dark" ? theme.white : theme.black,
      },
    },
  
    mainLinkInner: {
      display: "flex",
      alignItems: "center",
      flex: 1,
    },
  
    mainLinkIcon: {
      marginRight: theme.spacing.sm,
      color:
        theme.colorScheme === "dark"
          ? theme.colors.dark[2]
          : theme.colors.gray[6],
    },
  
    mainLinkBadge: {
      padding: 0,
      width: rem(20),
      height: rem(20),
      pointerEvents: "none",
    },
  
    collections: {
      paddingLeft: `calc(${theme.spacing.md} - ${rem(6)})`,
      paddingRight: `calc(${theme.spacing.md} - ${rem(6)})`,
      paddingBottom: "10px",
    },
  
    collectionsHeader: {
      paddingLeft: `calc(${theme.spacing.md} + ${rem(2)})`,
      marginBottom: rem(5),
    },
  
    collectionLink: {
      display: "flex",
      alignItems:"center",
      padding: `5px`,
      textDecoration: "none",
      borderRadius: theme.radius.sm,
      fontSize: "14px",
      color:
        theme.colorScheme === "dark"
          ? theme.colors.dark[0]
          : theme.colors.gray[7],
      lineHeight: 1,
      fontWeight: 500,
      cursor:"pointer",
  
      "&:hover": {
        backgroundColor:
          theme.colorScheme === "dark"
            ? theme.colors.dark[6]
            : theme.colors.gray[0],
        color: theme.colorScheme === "dark" ? theme.white : theme.black,
      },
    },
  }));
  
  export function VenueOwnerSiderbar() {
    const { classes } = useStyles();
  
    return (
      <Navbar
        height={700}
        width={{ sm: 300 }}
        p="md"
        className={classes.navbar}
        style={{ width: "inherit", minWidth: "inherit",height:"inherit",minHeight:"inherit" }}
      >
        <Navbar.Section className={classes.section}>
          <img
            className="logoImg"
            src={download}
            width={"80%"}
            style={{
              padding: "11.4px",
            }}
          />
        </Navbar.Section>
        {/* 
        <TextInput
          placeholder="Search"
          size="xs"
          icon={<IconSearch size="0.8rem" stroke={1.5} />}
          rightSectionWidth={70}
          rightSection={<Code className={classes.searchCode}>Ctrl + K</Code>}
          styles={{ rightSection: { pointerEvents: 'none' } }}
          mb="sm"
        /> */}
  
        <Navbar.Section className={classes.section} grow component={ScrollArea}>
          <Group className={classes.collectionsHeader} position="apart">
            <Text size="xs" weight={500} color="dimmed">
              MAIN
            </Text>
          </Group>
          <div className={classes.collections}>
          <Link to="/venue-owner" style={{ textDecoration: "none" }}>
            <div className={classes.collectionLink}>
              <IconLayoutDashboard className="sideIcon" />
              <span style={{marginLeft:"10px"}}>Dashboard</span>
            </div>
            </Link>
          </div>
          <Group className={classes.collectionsHeader} position="apart">
            <Text size="xs" weight={500} color="dimmed">
              LISTS
            </Text>
          </Group>
          <div className={classes.collections}>
            <Link to="/myVenue">
            <div className={classes.collectionLink}>
              <IconBuildingCottage className="sideIcon" />
              <span style={{marginLeft:"10px"}}>My Venue</span>
            </div>
            </Link>
            <Link to="/mycategories">
            <div className={classes.collectionLink}>
              <IconCategory className="sideIcon"/>
              <span style={{marginLeft:"10px"}}>Categories</span>
            </div>
  
            </Link>
            <div className={classes.collectionLink}>
              <IconCreditCard className="sideIcon"/>
              <span style={{marginLeft:"10px"}}>Bookings</span>
            </div>
          </div>
          <Group className={classes.collectionsHeader} position="apart">
            <Text size="xs" weight={500} color="dimmed">
              USEFUL
            </Text>
          </Group>
          <div className={classes.collections}>
            <div className={classes.collectionLink}>
              <IconChartBar className="sideIcon"/>
              <span style={{marginLeft:"10px"}}>Stats</span>
            </div>
            <div className={classes.collectionLink}>
              <IconBell className="sideIcon"/>
              <span style={{marginLeft:"10px"}}>Notifications</span>
            </div>
          </div>
          <Group className={classes.collectionsHeader} position="apart">
            <Text size="xs" weight={500} color="dimmed">
              SERVICE
            </Text>
          </Group>
          <div className={classes.collections}>
            <div className={classes.collectionLink}>
              <IconSettings className="sideIcon"/>
              <span style={{marginLeft:"10px"}}>Settings</span>
            </div>
          </div>
  
          <Group className={classes.collectionsHeader} position="apart">
            <Text size="xs" weight={500} color="dimmed">
              USER
            </Text>
          </Group>
          <div className={classes.collections}>
            <Link to='profile'>
            <div className={classes.collectionLink}>
              <IconUserCircle className="sideIcon"/>
              <span style={{marginLeft:"10px"}}>Profile</span>
            </div>
            </Link>
            <Link to="/auth">
            <div className={classes.collectionLink}>
              <IconArrowsExchange2 className="sideIcon" />
              <span style={{marginLeft:"10px"}}>Change Account</span>
            </div>
            </Link>
            <div className={classes.collectionLink}>
              <IconLogout className="sideIcon"/>
              <span style={{marginLeft:"10px"}}>Logout</span>
            </div>
          </div>
        </Navbar.Section>
      </Navbar>
    );
  }
  