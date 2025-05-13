from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.middleware.cors import CORSMiddleware
import pandas as pd

app = FastAPI()

# Habilitar CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/graph")
def get_graph():
    df = pd.read_parquet("data/graph_model.parquet")
    nodes = set(df["source"]).union(set(df["target"]))
    nodes_json = [{"id": node, "name": str(node)} for node in nodes]
    edges_json = [{"source": row["source"], "target": row["target"]} for _, row in df.iterrows()]
    return {"nodes": nodes_json, "links": edges_json}

app.mount("/", StaticFiles(directory="frontend", html=True), name="frontend")