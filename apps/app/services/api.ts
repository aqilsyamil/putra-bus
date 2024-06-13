
import { BusStop } from "@/types/data";
import axios from "axios";
import camelize from 'camelize';


const BASE_URL = 'https://putrabus-api.up.railway.app';
const axiosInstance = axios.create({ baseURL: BASE_URL})

const getBusStops = async (): Promise<BusStop[]> => {;
  return (await axiosInstance.get('bus-stops')).data.map((busStop: object) => {
    return camelize(busStop);
  });
}

export { getBusStops };
