import { useEffect, useState } from "react";
import "./Normal.scss";
import {
  AreaChart,
  Area,
  XAxis,
  // YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
} from "recharts";
import axios from "axios";



export default function Normal({ aspect, title }: any) {
  const [totalAmount, setTotalAmount] = useState();
  useEffect(() => {
    axios
      .get("https://kritisubedi.com.np/SnTravels/api/index//total-amount")
      .then((response) => {
        setTotalAmount(response.data.total_amount);
      })
      .catch((error) => {
        console.error("Error fetching data", error);
      });
  }, []);
  const data = [
    { name: "April", total: 0 },
    { name: "May", total: 0 },
    { name: "June", total: 0 },
    { name: "July", total: 0 },
    { name: "August", total: 0 },
    { name: "September", total: totalAmount },
  ];
  return (
    <div className="normal">
      <div className="title">{title}</div>{" "}
      <ResponsiveContainer width="100%" aspect={aspect} className="normalChart">
        <AreaChart
          width={730}
          height={250}
          data={data}
          margin={{ top: 10, right: 30, left: 0, bottom: 0 }}
          style={{ cursor: "pointer" }}
        >
          <defs>
            <linearGradient id="total" x1="0" y1="0" x2="0" y2="1">
              <stop offset="5%" stopColor="#8884d8" stopOpacity={0.8} />
              <stop offset="95%" stopColor="#8884d8" stopOpacity={0} />
            </linearGradient>
          </defs>
          <XAxis dataKey="name" stroke="gray" />
          <CartesianGrid strokeDasharray="3 3" className="chartGrid" />
          <Tooltip />
          <Area
            type="monotone"
            dataKey="total"
            stroke="#8884d8"
            fillOpacity={1}
            fill="url(#total)"
          />
        </AreaChart>
      </ResponsiveContainer>
    </div>
  );
}
