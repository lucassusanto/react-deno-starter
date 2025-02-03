// https://medium.com/js-dojo/vue-js-runtime-environment-variables-807fa8f68665
import { Config } from "./config.ts";
import process from "node:process";

export const getConfig = (config: Config): string =>
  (window as any)?.configs?.[config] ||
  import.meta.env[config] ||
  process.env[config] ||
  "";
