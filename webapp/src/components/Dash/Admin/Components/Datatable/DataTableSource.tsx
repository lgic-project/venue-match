import khaltilogo from "../../../../../assets/images/khaltilogo.png"
export const userColumns =[
    {field:"id",headerName:"ID",width:70},
    { field: "firstName", headerName: "User", width: 230, renderCell:(params:any)=>{
        return(
            <div className="cellWithImage">
                <img className = "cellImage" src="https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=785&q=80" alt="avatar"/>
                {params.row.firstName} {params.row.lastName}
            </div>
        )
    } },
    {field:"email",headerName:"Email",width:230},
    {field:"role",headerName:"Role",width:160,renderCell:(params:any)=>{
        return(
            <div className={`cellWithRole ${params.row.role}`}>{params.row.role}</div>
        )
    }},
    {field:"status",headerName:"Status",width:160,renderCell:()=>{
        return(
            <div className={`cellWithStatus pending`}>coming soon</div>
        )
    }},
]

export const venueColumns=[
    {field:"id",headerName:"ID",width:70},
    {field:"venue",headerName:"Venue Name",width:320,renderCell:(params:any)=>{
        return(
            <div className="cellWithImage">
                <img className = "cellImage" src={params.row.image} alt="venueImage"/>
                {params.row.name}
            </div>
        )
    }},
    {field:"location",headerName:"Location",width:350},
    {field:"price",headerName:"Price",width:160,renderCell:(params:any)=>{
        return(
            <>
            Nrs {params.row.price}
            </>
            
        )
    }}
]

export const categoryColumns=[
    {field:"id",headerName:"ID",width:90},
    {field:"name",headerName:"Category",width:820,renderCell:(params:any)=>{
        return(
            <div className="cellWithImage">
                <img className = "cellImage" src={params.row.image} alt="categoryImage"/>
                {params.row.name}
            </div>
        )
    }}
]

export const bookingColumns=[
    {field:"id",headerName:"ID",width:60},
    {field:"booked_date",headerName:"Booked Date",width:110},
    {field:"person",headerName:"Booked For",width:110,renderCell:(params:any)=>{
        return(
            <>
            {params.row.person} People
            </>
        )
    }},
    {field:"venue_price",headerName:"Venue Price",width:110,renderCell:(params:any)=>{
        return(
            <>
            Nrs {params.row.venue_price}
            </>
        )
    }},
    {field:"total_amount",headerName:"Total Paid",width:110,renderCell:(params:any)=>{
        return(
            <>
            Nrs {params.row.total_amount}
            </>
        )
    }},
    {field:"payment_medium",headerName:"Payment Medium",width:150,renderCell:(params:any)=>{
        return(
            <div className="cellWithImage" >
                <img className = "cellImage" src={khaltilogo} alt="categoryImage" style={{marginRight:"10px"}}/>
                {params.row.payment_medium}
            </div>
        )
    }},
    {field:"status",headerName:"Status",width:95,renderCell:(params:any)=>{
        return(
            <div className={`cellWithStatus ${params.row.status}`}>{params.row.status}</div>
        )
    }},
    {field:"category_id",headerName:"category_id",width:90},
    {field:"venue_id",headerName:"venue_id",width:90},
]