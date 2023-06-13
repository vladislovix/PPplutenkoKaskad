using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
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
    /// Логика взаимодействия для ClientControl2.xaml
    /// </summary>
    public partial class ClientControl2 : UserControl
    {
        diplomplEntities db;
        List<Клиента> tb;
        public ClientControl2()
        {
            InitializeComponent();
            db = new diplomplEntities();
            tb = db.Клиента.ToList();
            SuppliersDataGrid.ItemsSource = tb;
        }
        private void SearchButton_Click(object sender, RoutedEventArgs e)
        {
            var Search = db.Клиента.ToList();
            Search = Search.Where(x => x.ФИО_клиента.ToLower().StartsWith(SearchTextBox.Text.ToLower())).ToList();
            SuppliersDataGrid.ItemsSource = Search.ToList();
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            db = new diplomplEntities();
            Клиента item = SuppliersDataGrid.SelectedItem as Клиента;
            Клиента del = db.Клиента.Where(d => d.ID_клиента == item.ID_клиента).Single();
            db.Клиента.Remove(del);
            db.SaveChanges();
            MessageBox.Show("Строка успешно удалена!");
            refreshdatagrid();
        }
        private void refreshdatagrid()
        {
            SuppliersDataGrid.ItemsSource = db.Клиента.ToList();
            SuppliersDataGrid.Items.Refresh();
        }

        private void Add_button(object sender, RoutedEventArgs e)
        {
            var nw = new Клиента();
            db.Клиента.Add(nw);
            AddClient add = new AddClient(db, nw);
            add.ShowDialog();
            refreshdatagrid();
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }
}
