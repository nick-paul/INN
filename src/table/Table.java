package table;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * A simple class for creating and rendering general HTML tables dynamically. 
 * Create tables like so:
 * <pre>
 *   Table table = new Table("Animal", "Sound");
 *   table.addRow("Dog", "woof!");
 *   table.addRow("Cat", "meow!");
 *   String htmlStr = table.toHTML();
 * </pre>
 * 
 * @author npaul
 *
 */
public class Table {
	private ArrayList<Column> columns;
	private HashMap<String, Integer> colMap;
	private int numCols;
	private String options;
	
	/**
	 * Default table constructor. Initializes an empty table.
	 */
	public Table() {
		this.numCols = 0;
		this.columns = new ArrayList<Column>();
		this.colMap = new HashMap<String, Integer>();
	}
	
	/**
	 * Creates a table with empty columns. Each column header is given.
	 * @param colNames
	 */
	public Table(String... colNames) {
		this.numCols = 0;
		columns = new ArrayList<Column>();
		this.colMap = new HashMap<String, Integer>();
		for (String name : colNames) {
			addCol(name, "");
		}
	}
	
	/**
	 * Add a column to tha table. If the table already has a column with this name,
	 * do not add the column and return false.
	 * @param name
	 * @param items
	 */
	public boolean addCol(String name, ArrayList<String> items) {
		if (colMap.containsKey(name)) {
			return false;
		}
		columns.add(new Column(name, items));
		colMap.put(name, numCols);
		this.numCols += 1;
		return true;
	}

	/**
	 * Add a column to the table. Each row of the column will contain the text given.
	 * If the text contains a {{n}} (where n is some existing column number), then the data
	 * in that column will be inserted at that location. If the text contains {{ri}}
	 * than the row index (zero indexed) will be inserted at that location. Finally, If
	 * the text contains a {{ri1}} the row index + 1 will be inserted at the location.
	 * 
	 * @param colHdr
	 * @param text
	 */
	public void addCol(String colHdr, String text) {	
		if (colMap.containsKey(colHdr)) {
			return;
		}
		
		ArrayList<String> items = new ArrayList<>(this.rows());
		for (int r = 0; r < this.rows(); r++) {
			String rowText = text;
			for (int c = 0; c < this.numCols; c++) {
				//{{1}} - value in column 1
				if (rowText.contains("{{" + c + "}}")) {
					rowText = rowText.replace("{{" + c + "}}", getItem(r,c));
				} 
				
				//{{ri}} - row index (0 index)
				if (rowText.contains("{{ri}}")) {
					rowText = rowText.replace("{{ri}}", ""+r);
				}
				
				//{{ri1}} - row index (1 index)
				if (rowText.contains("{{ri1}}")) {
					rowText = rowText.replace("{{ri1}}", ""+(r+1));
				}
			}
			items.add(rowText);
		}
		
		addCol(colHdr, items);
	}
	
	public int getColIndex(String name) {
		Integer i = colMap.get(name);
		if (i == null)
			return -1;
		return i;
	}
	
	private String getItem(int row, int col) {
		int rowCount = rows();
		int colCount = cols();
		if (colCount == 0
				|| rowCount == 0
				|| col >= colCount
				|| row >= rowCount ) {
			return "";
		} else {
			return columns.get(col).items.get(row);
		}
	}
	
	/**
	 * Add a row of items to the table. If the number of items does not match
	 * the number of columns, then return false and do nothing.
	 * @param strings
	 * @return
	 */
	public boolean addRow(ArrayList<String> strings) {
		if (strings.size() == numCols) {
			for (int i = 0; i < strings.size(); i++) {
				columns.get(i).addItem(strings.get(i));
			}
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * Add a row of items to the table. If the number of items does not match
	 * the number of columns, then return false and do nothing.
	 * @param strings
	 * @return
	 */
	public boolean addRow(String... strings) {
		if (strings.length == numCols) {
			for (int i = 0; i < strings.length; i++) {
				columns.get(i).addItem(strings[i]);
			}
			return true;
		} else {
			return false;
		}
	}
	
	/** Number of rows in the table */
	public int rows() {
		if (this.columns.size() > 0) {	
			return this.columns.get(0).size();
		} else {
			return 0;
		}
	}
	
	/** Number of cols in the table */
	public int cols() {
		return numCols;
	}
	
	/**
	 * Convert the table to an HTML table. Only the given column names
	 * will be added to the table. If a given column name does not exist,
	 * then do not add it to the table.
	 * 
	 * @param columnNames
	 * @return
	 */
	public String toHTML(String... columnNames) {
		
		//Reference Columns in local array
		ArrayList<Column> outCols = new ArrayList<Column>(columnNames.length);
		for (String name : columnNames) {
			Integer idx = colMap.get(name);
			if (idx == null || idx < 0 || idx >= cols()) {
				//Do not add
			} else {
				outCols.add(columns.get(idx));
			}
		}
		
		return renderHTML(outCols);
	}
	
	/**
	 * Render all columns of the table to an HTML table
	 * @return
	 */
	public String toHTML() {
		return renderHTML(this.columns);
	}
	
	/**
	 * Helper function for rendering HTML tables. 
	 * 
	 * @see toHTML
	 * @param cols
	 * @return
	 */
	private String renderHTML(ArrayList<Column> cols) {
		if(this.rows() == 0|| this.cols() == 0) {
			return "";
		}
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("<table " + this.options + " class=\"table table-striped\">\n");
		
		//Headers
		sb.append("\t<tr>\n");
		for (int i = 0; i < cols.size(); i++) {
			sb.append("\t\t<th>").append(cols.get(i).name).append("</th>\n");
		}
		sb.append("\t</tr>\n");
		
		//Rows
		int numRows = cols.size() > 0 ? cols.get(0).size() : 0;
		for (int r = 0; r < numRows; r++) {
			sb.append("\t<tr>\n");
			for (int c = 0; c < cols.size(); c++) {
				sb.append("\t\t<td>").append(cols.get(c).getItem(r)).append("</td>\n");
			}
			sb.append("\t</tr>\n");
		}
		
		sb.append("</table>");

		return sb.toString();
	}
	
	
	/**
	 * Inner class for the Table class. Each column is simply a
	 * header string and a list of items.
	 * @author npaul
	 *
	 */
	class Column {
	    String name;
		ArrayList<String> items;
		
		public Column(String name) {
			this.name = name;
			this.items = new ArrayList<String>();
		}
		
		public Column(String name, ArrayList<String> items) {
			this.name = name;
			this.items = items;
		}
		
		public void addItem(String s) {
			this.items.add(s);
		}
		
		public String getItem(int i) {
			return i >= items.size() ? "" : items.get(i);
		}
		
		public int size() {
			return items.size();
		}
	}
	
	/**
	 * Set the table's options (i.e. "border='1'")
	 * @param options
	 */
	public void setOptions(String options) {
		this.options = options;
	}
	
	public static void main(String[] args) {
		Table table = new Table("one", "two", "three");
		table.addRow("1", "2", "3");
		table.addRow("10", "11", "12");
		table.addCol("Additional Col", "Colum 2, Row {{ri1}}");
		
		
		System.out.println(table.toHTML("two", "one"));
		
	}
}