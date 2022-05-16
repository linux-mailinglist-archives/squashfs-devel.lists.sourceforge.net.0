Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEBC52E33B
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZh-0007HL-Og; Fri, 20 May 2022 03:45:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <lkp@intel.com>) id 1nqdAR-00012y-0Y
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 16:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IRH1P70NpND9FXhKPrlcZlMoxs+1IDy69MRztPD9Umw=; b=mUf1fSDVLoL+Y9rwEWnKJKiSHc
 0oELhJ4coqzehZ7F/NSOghQgI8M7SKCgvMtYMY/9KOxj21icQERyXescakTazALbje6ZuiWnRxejL
 ND1UeTRnz9MDgVTzO0QaJKDfXSEdE1Qb4VIBwfZe8gTP5pMonxZFUezhcop62aCAP9cA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IRH1P70NpND9FXhKPrlcZlMoxs+1IDy69MRztPD9Umw=; b=kWZ7dSDRcAPvBY9KGrmoFuaPvN
 Amj/RKJwiaEnbW4Vd2a8b04FpK2LKtfp7cRE546jOXk28XEnzqncxJ8iPQ5jNq7YIEOFiHKLBF4g9
 f76qTco4NaCgxF2Bx33f2GNuqmvRojaHhy+ILGsHyXZlyEeaP0GdO8/QUZG4z385cQIw=;
Received: from mga11.intel.com ([192.55.52.93])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nqdAK-00HRCS-6c
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 16:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652716908; x=1684252908;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fBNoPYC+AzPfsuy4pnV76WxKwm4bho5IO8lAkn5pzEU=;
 b=lWXoatsJ+C8LMgdxNPr73gsbkH1Ud2+sRl2hGIMLWGeAd/tdqGhyoBQF
 RzwmNOxS/GbvNGYgplaz1gpDD+fFN+HNSCDCqLZRIPIpQOpv14PjyOGAC
 CKhRbgUwu9HbBt3Dz2PnJYDA8aoO+Sqz7IXl+C7eo4+3hUdrqZpwyc9Dw
 i74nsGFPW1biNwvK4oaxdNVooiXy7iKhie8+YnzidAnL96JQeLxlAKrtB
 xfw+rZrAcQeLv+Ojo3z49jwln2hK1C0iSsjqCVfrvHvgbwVpoBUPgO+Xd
 UwPimDA8FZjxIcmx4xQstU1IaIoNFjmF1I0mj+sKnCx0CsFZVXb2tSdGy w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="268460192"
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; d="scan'208";a="268460192"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 09:01:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; d="scan'208";a="574076757"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 16 May 2022 09:01:37 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nqdA8-0000Ag-O2;
 Mon, 16 May 2022 16:01:36 +0000
Date: Tue, 17 May 2022 00:01:13 +0800
From: kernel test robot <lkp@intel.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>,
 Xiongwei Song <Xiongwei.Song@windriver.com>
Message-ID: <202205162301.zVca8ZpM-lkp@intel.com>
References: <20220516105100.1412740-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220516105100.1412740-3-hsinyi@chromium.org>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Hsin-Yi,
 Thank you for the patch! Yet something to improve:
 [auto build test ERROR on next-20220513] [cannot apply to
 akpm-mm/mm-everything
 v5.18-rc7 v5.18-rc6 v5.18-rc5 v5.18-rc7] [If your patch is applied to the
 wrong git tree, kindly drop us a note. And whe [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [192.55.52.93 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqdAK-00HRCS-6c
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:10 +0000
Subject: Re: [Squashfs-devel] [PATCH 2/2] squashfs: implement readahead
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>, kbuild-all@lists.01.org,
 Zhang Yi <yi.zhang@huawei.com>, linux-kernel@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Hi Hsin-Yi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220513]
[cannot apply to akpm-mm/mm-everything v5.18-rc7 v5.18-rc6 v5.18-rc5 v5.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Hsin-Yi-Wang/Implement-readahead-for-squashfs/20220516-185438
base:    1e1b28b936aed946122b4e0991e7144fdbbfd77e
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20220516/202205162301.zVca8ZpM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/573e1f2ced0df097c30c595d5bf5a9e7a5fcb8d5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hsin-Yi-Wang/Implement-readahead-for-squashfs/20220516-185438
        git checkout 573e1f2ced0df097c30c595d5bf5a9e7a5fcb8d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   fs/squashfs/file.c: In function 'squashfs_readahead':
>> fs/squashfs/file.c:526:17: error: implicit declaration of function 'squashfs_page_actor_init_special'; did you mean 'squashfs_page_actor_init'? [-Werror=implicit-function-declaration]
     526 |         actor = squashfs_page_actor_init_special(pages, max_pages, 0);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 squashfs_page_actor_init
   fs/squashfs/file.c:526:15: warning: assignment to 'struct squashfs_page_actor *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     526 |         actor = squashfs_page_actor_init_special(pages, max_pages, 0);
         |               ^
   fs/squashfs/file.c: At top level:
>> fs/squashfs/file.c:577:9: error: request for member 'readahead' in something not a structure or union
     577 |         .readahead = squashfs_readahead
         |         ^
   cc1: some warnings being treated as errors


vim +526 fs/squashfs/file.c

   498	
   499	static void squashfs_readahead(struct readahead_control *ractl)
   500	{
   501		struct inode *inode = ractl->mapping->host;
   502		struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
   503		size_t mask = (1UL << msblk->block_log) - 1;
   504		size_t shift = msblk->block_log - PAGE_SHIFT;
   505		loff_t req_end = readahead_pos(ractl) + readahead_length(ractl);
   506		loff_t start = readahead_pos(ractl) &~ mask;
   507		size_t len = readahead_length(ractl) + readahead_pos(ractl) - start;
   508		struct squashfs_page_actor *actor;
   509		unsigned int nr_pages = 0;
   510		struct page **pages;
   511		u64 block = 0;
   512		int bsize, res, i, index;
   513		int file_end = i_size_read(inode) >> msblk->block_log;
   514		unsigned int max_pages = 1UL << shift;
   515	
   516		readahead_expand(ractl, start, (len | mask) + 1);
   517	
   518		if (readahead_pos(ractl) + readahead_length(ractl) < req_end ||
   519		    file_end == 0)
   520			return;
   521	
   522		pages = kmalloc_array(max_pages, sizeof(void *), GFP_KERNEL);
   523		if (!pages)
   524			return;
   525	
 > 526		actor = squashfs_page_actor_init_special(pages, max_pages, 0);
   527		if (!actor)
   528			goto out;
   529	
   530		for (;;) {
   531			nr_pages = __readahead_batch(ractl, pages, max_pages);
   532			if (!nr_pages)
   533				break;
   534	
   535			if (readahead_pos(ractl) >= i_size_read(inode) ||
   536			    nr_pages < max_pages)
   537				goto skip_pages;
   538	
   539			index = pages[0]->index >> shift;
   540			if ((pages[nr_pages - 1]->index >> shift) != index)
   541				goto skip_pages;
   542	
   543			bsize = read_blocklist(inode, index, &block);
   544			if (bsize == 0)
   545				goto skip_pages;
   546	
   547			res = squashfs_read_data(inode->i_sb, block, bsize, NULL,
   548						 actor);
   549	
   550			if (res >= 0)
   551				for (i = 0; i < nr_pages; i++)
   552					SetPageUptodate(pages[i]);
   553	
   554			for (i = 0; i < nr_pages; i++) {
   555				unlock_page(pages[i]);
   556				put_page(pages[i]);
   557			}
   558		}
   559	
   560		kfree(actor);
   561		kfree(pages);
   562		return;
   563	
   564	skip_pages:
   565		for (i = 0; i < nr_pages; i++) {
   566			unlock_page(pages[i]);
   567			put_page(pages[i]);
   568		}
   569	
   570		kfree(actor);
   571	out:
   572		kfree(pages);
   573	}
   574	
   575	const struct address_space_operations squashfs_aops = {
   576		.read_folio = squashfs_read_folio
 > 577		.readahead = squashfs_readahead

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
