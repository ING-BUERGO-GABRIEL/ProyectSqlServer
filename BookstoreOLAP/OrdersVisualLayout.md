# Guía de colocación de medidas para Orders (BookstoreOLAP)

Esta guía indica en qué zonas de una tabla o matriz de Power BI colocar las medidas sugeridas para el cubo **BookstoreOLAP** con énfasis en **Orders**.

## Campos en el área de filas/columnas
- **Filas**: agrega atributos de análisis (ej. `Date[MonthName]`, `Date[CalendarYear]`, `Book[Title]`, `Customer[Country]`, `ShippingMethod[MethodName]`).
- **Columnas** (opcional): usa jerarquías de tiempo (`Date[CalendarQuarter]`, `Date[CalendarYear]`) o categorías como `OrderStatus[StatusValue]` cuando quieras comparar por estado.

## Medidas en el área de Valores
Coloca estas medidas solo en **Valores** para que se agreguen sobre las filas/columnas elegidas:

| Medida recomendada | Ubicación | Descripción breve |
| --- | --- | --- |
| `Total Quantity` (`SUM(Orders[Quantity])`) | Valores | Unidades totales vendidas. |
| `Total Orders` (`DISTINCTCOUNT(Orders[OrderID])`) | Valores | Número de pedidos. |
| `Total Gross Sales` (`SUMX(Orders, Orders[Quantity] * Orders[UnitPrice])`) | Valores | Importe bruto sin descuentos. |
| `Average Order Value` (`DIVIDE([Total Gross Sales], [Total Orders])`) | Valores | Ticket promedio. |
| `Completed Orders` (`CALCULATE([Total Orders], OrderStatus[StatusValue] = "Completed")`) | Valores | Pedidos completados. |
| `Shipping Cost (Base)` (`SUMX(VALUES(Orders[OrderID]), MAX(ShippingMethod[BaseCost]))`) | Valores | Costo base de envío por pedido. |
| `Gross Profit` (`[Total Gross Sales] - [Shipping Cost (Base)]`) | Valores | Margen bruto estimado. |

## Sugerencia de disposición inicial en la tabla/matriz
- **Filas**: `Date[MonthName]` (o `Date[CalendarYear]` si deseas vista anual).
- **Valores**: 
  1. `Total Quantity`
  2. `Total Orders`
  3. `Total Gross Sales`
  4. `Average Order Value`
  5. `Completed Orders`
  6. `Shipping Cost (Base)`
  7. `Gross Profit`
- **Filtros/segmentadores**: `OrderStatus[StatusValue]`, `ShippingMethod[MethodName]`, `Customer[Country]`.

> Consejo: si necesitas una sola cifra (como en la celda de la captura), usa **Tarjeta** en Power BI y selecciona la medida (p. ej., `Total Quantity`). Para comparar varias medidas en filas/columnas, usa **Tabla** o **Matriz** y arrastra cada medida al panel **Valores** en el orden que se indica.
