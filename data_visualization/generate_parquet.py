import pandas as pd

# Definir relaciones entre entidades (nodos del grafo)
data = {
    "source": ["User", "User", "Order", "Order", "Product", "Category"],
    "target": ["Order", "Profile", "Product", "Payment", "Category", "Department"]
}

df = pd.DataFrame(data)

# Guardar como archivo Parquet (requiere pyarrow o fastparquet)
df.to_parquet("data/graph_model.parquet", index=False)
    