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

const data = [
  { name: "January", total: 0 },
  { name: "February", total: 0 },
  { name: "March", total: 0 },
  { name: "April", total: 0 },
  { name: "May", total: 0 },
  { name: "June", total: 19100 },
];

export default function Normal({ aspect, title }: any) {
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
