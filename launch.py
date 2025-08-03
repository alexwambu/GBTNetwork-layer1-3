import streamlit as st
import requests

st.set_page_config(page_title="GBTNetwork Launcher", page_icon="🟡")
st.title("🟡 GBTNetwork RPC Launcher")
st.markdown("RPC is live at:")
st.code("http://localhost:8545", language="bash")
st.code("http://GBTNetwork:8545", language="bash")
st.success("Use `https://GBTNetwork` in MetaMask Custom RPC")
