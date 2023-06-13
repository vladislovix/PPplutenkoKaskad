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
    /// Логика взаимодействия для TovarControl5.xaml
    /// </summary>
    public partial class TovarControl5 : UserControl
    {
        diplomplEntities db;
        List<Товары> tb;
        public TovarControl5()
        {
            InitializeComponent();
            db = new diplomplEntities();
            tb = db.Товары.ToList();
            SuppliersDataGrid.ItemsSource = tb;
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void SearchButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Add_button(object sender, RoutedEventArgs e)
        {

        }
    }
}
