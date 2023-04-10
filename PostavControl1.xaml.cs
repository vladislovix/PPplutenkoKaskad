using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PPplutenkoKaskad
{
    /// <summary>
    /// Логика взаимодействия для PostavControl1.xaml
    /// </summary>
    public partial class PostavControl1 : UserControl
    {
        PPplutenkoEntities db;
        List<Поставщики> tb;
        public PostavControl1()
        {
            InitializeComponent();
            db = new PPplutenkoEntities();
            tb = db.Поставщики.ToList();
            SuppliersDataGrid.ItemsSource = tb;

        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Hello from Window 1!");
        }



        private void SearchButton_Click(object sender, RoutedEventArgs e)
        {
            var Search = db.Поставщики.ToList();
            Search = Search.Where(x => x.Наименование_поставщика.ToLower().StartsWith(SearchTextBox.Text.ToLower())).ToList();
            SuppliersDataGrid.ItemsSource = Search.ToList();
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            db = new PPplutenkoEntities();
            Поставщики item = SuppliersDataGrid.SelectedItem as Поставщики;
            Поставщики del = db.Поставщики.Where(d => d.ID_поставщика == item.ID_поставщика).Single();
            db.Поставщики.Remove(del);
            db.SaveChanges();
            MessageBox.Show("Строка успешно удалена!");
            refreshdatagrid();
        }

        private void Add_button(object sender, RoutedEventArgs e)
        {
            var nw = new Поставщики();
            db.Поставщики.Add(nw);
            AddPostav add = new AddPostav(db, nw);
            add.ShowDialog();
            refreshdatagrid();
        }
        private void refreshdatagrid()
        {
            SuppliersDataGrid.ItemsSource = db.Поставщики.ToList();
            SuppliersDataGrid.Items.Refresh();
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }
}
